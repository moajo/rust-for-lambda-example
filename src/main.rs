use lambda_runtime::{run, service_fn, Error, LambdaEvent};
use serde_json::Value;

#[tokio::main]
async fn main() -> Result<(), Error> {
    let runtime_handler = service_fn(handler);
    run(runtime_handler).await?;
    Ok(())
}

pub async fn handler(event: LambdaEvent<Value>) -> Result<Value, Error> {
    // Ok(Value::String("hello world".to_string()))
    Ok(event.payload)
}
