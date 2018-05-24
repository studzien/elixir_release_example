~w(rel plugins *.exs)
|> Path.join()
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"kD5}s6QEvI(QGqsSJWu%!HkG?&5ox`5={TPDk}Z{~.DJ~%lJ=[ee=mG%e8LPug2,"
end

release :releases do
  set version: current_version(:releases)
  set applications: [
    :runtime_tools
  ]
end

