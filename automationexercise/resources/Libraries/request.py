import requests


user_data = {
        'name': 'John Doe',
        'email': 'john.do234e@example.com',
        'password': 'securepassword123',
        'title': 'Mr',  # Could be 'Mr', 'Mrs', 'Miss', etc.
        'birth_date': '15',
        'birth_month': 'August',
        'birth_year': '1985',
        'firstname': 'John',
        'lastname': 'Doe',
        'company': 'Tech Solutions',
        'address1': '123 Main Street',
        'address2': 'Apt 4B',
        'country': 'USA',
        'zipcode': '10001',
        'state': 'NY',
        'city': 'New York',
        'mobile_number': '+1234567890'
}

def api_fetch(uri, method,req_params=user_data):
        method = method.lower()  # Make sure the method is lowercase

        try:
            match method:
                case "get":
                    response = requests.get(uri, timeout=60)

                case "post":
                    response = requests.post(uri, data=req_params, timeout=60)

                case "put":
                    response = requests.put(uri, data=req_params, timeout=60)

                case "patch":
                    response = requests.patch(uri, data=req_params, timeout=60)

                case "delete":
                    response = requests.delete(uri,data=req_params,timeout=60)

                case _:
                    return print('Wrong method!')

            # Check if the request was successful
            response.raise_for_status()
        
        except requests.exceptions.Timeout:
            print("Request timed out.")
        
        except requests.exceptions.RequestException as e:
            print(f"Response error due to: '{e}'")
        
        else:
            # Parse the JSON response if the call was successful
            api_response = response.json()
            return api_response
        