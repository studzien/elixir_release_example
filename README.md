# Releases

```bash
git checkout 0.1.0
rm -rf _build
mkdir -p deploy

make rel
cp _build/prod/rel/releases/releases/0.1.0/releases.tar.gz deploy/
(cd deploy && tar xzf releases.tar.gz)

./deploy/bin/releases console
iex(releases@127.0.0.1)2> ReleaseVersion.get
"0.1.0"

git checkout 0.2.0
make appup

cat rel/appups/releases/0.1.0_to_0.2.0.appup
{"0.2.0",
 [{"0.1.0",[{update,'Elixir.ReleaseVersion',{advanced,[]},[]}]}],
 [{"0.1.0",[{update,'Elixir.ReleaseVersion',{advanced,[]},[]}]}]}.

make rel
mkdir -p deploy/releases/0.2.0
cp _build/prod/rel/releases/releases/0.2.0/releases.tar.gz deploy/releases/0.2.0
_build/prod/rel/releases/bin/releases upgrade 0.2.0

iex(releases@127.0.0.1)3> ReleaseVersion.get
"0.2.0"

git checkout 0.3.0
make appup

cat rel/appups/releases/0.2.0_to_0.3.0.appup
{"0.3.0",
 [{"0.2.0",[{update,'Elixir.ReleaseVersion',{advanced,[]},[]}]}],
 [{"0.2.0",[{update,'Elixir.ReleaseVersion',{advanced,[]},[]}]}]}.

make rel

mkdir -p deploy/releases/0.3.0
cp _build/prod/rel/releases/releases/0.3.0/releases.tar.gz deploy/releases/0.3.0
_build/prod/rel/releases/bin/releases upgrade 0.3.0

iex(releases@127.0.0.1)4> ReleaseVersion.get
"0.3.0"

_build/prod/rel/releases/bin/releases downgrade 0.1.0
Release releases:0.1.0 is already unpacked!
Release releases:0.1.0 is marked old, switching to it..
Release handler failed to install: {:no_matching_relup, '0.1.0', '0.3.0'}

_build/prod/rel/releases/bin/releases downgrade 0.2.0
iex(releases@127.0.0.1)7> ReleaseVersion.get
"0.2.0"

_build/prod/rel/releases/bin/releases downgrade 0.1.0
iex(releases@127.0.0.1)8> ReleaseVersion.get
"0.1.0"
```
