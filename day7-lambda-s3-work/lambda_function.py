def lambda_handler(event, context):
    return {
        'statuscode': 200,
        'body': 'Hello from Lambda!'
    }