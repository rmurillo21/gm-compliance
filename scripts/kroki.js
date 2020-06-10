const asciidoctor = require('@asciidoctor/core')()
const kroki = require('asciidoctor-kroki')

const input = 'plantuml::hello.puml[svg,role=sequence]'

kroki.register(asciidoctor.Extensions)
console.log(asciidoctor.convert(input)) // <1>

const registry = asciidoctor.Extensions.create()
kroki.register(registry)
console.log(asciidoctor.convert(input, {'extension_registry': registry})) // <2>