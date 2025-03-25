# API Documentation

## Users Endpoints

### GET /users
Returns a list of all users.

**Response:**
- Status: 200 OK
- Body: Array of user objects

### GET /users/:id
Returns a specific user by ID.

**Parameters:**
- `id` (path parameter): User ID

**Response:**
- Status: 200 OK
- Body: User object

### GET /users/show_by_name
Returns a user by their name.

**Parameters:**
- `name` (query parameter): User's name

**Response:**
- Status: 200 OK
- Body: User object

### POST /users
Creates a new user.

**Parameters:**
- Body parameters (JSON):
  ```json
  {
    "user": {
      "name": "string",
      "lastname": "string",
      "birthdate": "date",
      "password": "string",
      "description": "string",
      "image": "string"
    }
  }
  ```

**Response:**
- Status: 201 Created
- Body: Created user object

### PATCH/PUT /users/:id
Updates an existing user.

**Parameters:**
- `id` (path parameter): User ID
- Body parameters (JSON):
  ```json
  {
    "user": {
      "name": "string",
      "lastname": "string",
      "birthdate": "date",
      "password": "string",
      "description": "string",
      "image": "string"
    }
  }
  ```
(All body parameters are optional)

**Response:**
- Status: 200 OK
- Body: Updated user object

### DELETE /users/:id
Deletes a user.

**Parameters:**
- `id` (path parameter): User ID

**Response:**
- Status: 204 No Content

## Assets Endpoints

### GET /assets
Returns logo image and a random phrase.

**Parameters:**
- `logo_type` (query parameter): Type of logo to return ("dark" or "light")

**Response:**
- Status: 200 OK
- Body:
  ```json
  {
    "image": "base64_encoded_string",
    "random_sentence": "string"
  }
  ```

**Error Responses:**
- Status: 422 Unprocessable Entity
  - When logo type is not supported
- Status: 404 Not Found
  - When image file is not found
  - When phrases file is not found

## Health Check Endpoint

### GET /ping
Simple health check endpoint.

**Response:**
- Status: 200 OK
- Body:
  ```json
  {
    "message": "Hi Emma papi Kike finally could set me up"
  }
  ```
