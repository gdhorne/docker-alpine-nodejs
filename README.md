# NodeJS Docker Container

Created as a learning aid for the participants in the Hack Reactor (HR) 
Structured Study Program (SSP) which focuses on Javascript.

**Disclaimer:** I am a participant in the Hack Reactor SSP19 
(2018-01-29 - 2018-02-25) but otherwise no affiliation with Hack Reactor is 
implied nor inferred.

## Instructions

### Automated Build

```
docker pull gdhorne/docker-alpine-nodejs
```
### Transient container instance with out-of-container storage

The _docker run_ command must be executed each time NodeJS is used with either
 `node` or `npm`.

```
docker run -i -t -v ${PWD}:/opt/project --rm nodejs [[node ... | npm ...]]
```

**Recommendation:** Use the transient instance wrapper script, _transient.sh_, 
passing either the node command or the npm command with any arguments.

#### Example

```
./transient.sh node
```
_Note: To exit interactive mode type either '.exit' (no quotes) or press CTRL+D._

```
./transioent.sh node demo.js
```

```
./transient.sh npm "install express --no-bin-links"
```

### Persistent container instance with optional out-of-container storage

The _docker run_ command should only be used one time unless the container 
instance has been deleted.

```
docker run -i -t [-v ${PWD}:/opt/project] --name nodejs [[node ... | npm ...]] 
docker start nodejs
docker exec [-i -t] nodejs [node ... | npm ...]
docker stop nodejs
```

**Recommendation:** Use the persistent instance wrapper script, _persistent.sh_,
passing either the node command or the npm command with any arguments.

To delete the persistent container instance,
```
docker stop nodejs && docker rm nodejs
```

#### Example

```
./persistent.sh node
```

_Note: To exit interactive mode type either '.exit' (no quotes) or press CTRL+D._
_ It might take several seconds to complete._

```
./persistent.sh node demo.js
```

```
./persistent.sh npm "install express --no-bin-links"
```


**If out-of-container storage was not used to save your files, they cannot be 
recovered from a delete container instance.**

