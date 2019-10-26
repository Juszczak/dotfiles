# lift

Example `lift.config.json`

```
{
  "project_path": "/etc/app",
  "services": {
    "ws": {
      "path": "server/ws/",
      "command": "MAVEN_OPTS=\"$MAVEN_OPTS -Xmx128m -agentlib:jdwp=transport=dt_socket\" mvn tomcat7:run",
      "log": "logs/ws.log"
    },
    "log": {
      "path": "logs",
      "command": "tail -f *.log | ccze"
    }
  }
}
```
