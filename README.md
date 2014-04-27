## Rbmq

Implementation of Message Queue Based STOMP in Ruby  

## STOMP
STOMP is a frame based protocol, with frames modelled on HTTP. A frame consists of a command, a set of optional headers and an optional body. STOMP is text based but also allows for the transmission of binary messages. The default encoding for STOMP is UTF-8, but it supports the specification of alternative encodings for message bodies.

[STOMP Protocol Specification, Version 1.2](http://stomp.github.io/stomp-specification-1.2.html)

### Frame Basic Format
The frame starts with a `command` string, following the command are zero or more header entries in `<key>:<value>` format.
A blank line (i.e. an extra EOL) indicates the end of the headers and the beginning of the `body`.

    COMMAND
    header1:value1
    header2:value2

    Body^@

### Installation

### Usage
