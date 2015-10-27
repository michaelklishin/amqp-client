(** Connection *)
open Async.Std
type t

(** Connect to an Amqp server.
    [connect "test" localhost] connects to localhost using default guest credentials, with identity "test"
    @param id is an identifier of the connection used for tracing and debugging
    @param credentials a tuple of username * password. The credentials are transmitted as plain text
*)
val connect :
  id:string ->
  ?virtual_host:string ->
  ?port:int ->
  ?credentials:string * string -> string -> t Deferred.t

(** Open a new channel.
    [id] identifies the channel for tracing and debugging
*)
val open_channel : id:string -> t -> Amqp_channel.t Deferred.t
