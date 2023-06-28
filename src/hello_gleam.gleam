import mist
import gleam/erlang/process
import gleam/bit_builder
import gleam/http/response.{Response}

pub fn main() {
  let assert Ok(_) =
    mist.run_service(8080, web_service, max_body_limit: 4_000_000)
  process.sleep_forever()
}

fn web_service(_request) {
  let body = bit_builder.from_string("Update, Gleam!")
  Response(200, [], body)
}
