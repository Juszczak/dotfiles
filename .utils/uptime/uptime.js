#!/usr/local/bin/node

let uptime = require('os').uptime()
const days = Math.floor(uptime / 86400)
uptime -= days * 86400
const hours = Math.floor(uptime / 3600) % 24
uptime -= hours * 3600
const minutes = Math.floor(uptime / 60) % 60
uptime -= minutes * 60
console.log(`${days ? `${days}:` : ''}${hours}:${minutes}`)
