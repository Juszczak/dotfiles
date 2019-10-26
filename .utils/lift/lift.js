#!/usr/bin/env node

const { resolve } = require("path");
const { homedir } = require("os");
const { readFileSync } = require("fs");

function load_config() {
  return JSON.parse(readFileSync(resolve(__dirname, "lift.conf.json"), "utf8"));
}

function escape_command(command) {
  return command.replace(/"/g, '\\"');
}

function parse_config_entry([service_name, { path, command, log }]) {
  const tee = log ? `| tee ${resolve(project_path, log)}` : "";
  return {
    name: service_name,
    cd: resolve(project_path, path),
    command: `${command} ${tee}`
  };
}

function prepare_arguments({ name, cd, command }) {
  return `-n ${name} -p ${cd} -c '${command}'`;
}

function print(input) {
  process.stdout.write(input);
}

function filter_service([service_name]) {
  return service_name === process.argv[2];
}

const { services, project_path } = load_config();

Object.entries(services)
  .filter(filter_service)
  .map(parse_config_entry)
  .map(prepare_arguments)
  .forEach(print);
