from db import verify_connection


if __name__ == "__main__":
    try:
        verify_connection()
        print("CognoDB connection successful!")
    except Exception as error:
        print("CognoDB connection failed.")
        print(f"Error: {error}")