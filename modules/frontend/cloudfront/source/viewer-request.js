async function handler(event) {
    const authorizationHeader = event.request.headers && event.request.headers.authorization;

    const username = '${authen_username}';
    const password = '${authen_password}';

    const preferredAuthorization = 'Basic ' + Buffer.from(username + ':' + password).toString('base64');

    // If the authentication header is matching the preferred authentication
    // then return the request to the origin
    if (authorizationHeader && authorizationHeader.value === preferredAuthorization) {
        return event.request;
    }

    // If the authentication header is not matching the preferred authentication
    // then return a 401 response to the client
    // this will trigger the browser to show the authentication dialog
    return {
        statusCode: 401,
        statusDescription: "Unauthorized",
        headers: {
            "www-authenticate": { value: 'Basic' },
        },
    };
}
