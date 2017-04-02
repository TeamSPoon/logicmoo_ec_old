Slack Prolog Client
=================

This library provides a websocket API to slack

https://github.com/swi-to-yap/slack_prolog/

![](t/slack.png)

## Useful to Me?

* A Prolog client for the Slack [Web](https://api.slack.com/web) and [RealTime Messaging](https://api.slack.com/rtm) APIs. 
* Still has a way to go but it gets users started by seeing how easy it was.
* This piece of the puzzle will help you send messages to Slack via the Web API and send and receive messages via the Real Time API.
* If you're trying to respond to slash commands, just write a basic web application and use this library to call the Slack Web API.

## TODOS

* In development add event hooks for users
* Currently Posts over the https webclient (change this to the RTM)



## Usage

### Create a New Bot Integration

This is something done in Slack, under [integrations](https://my.slack.com/services). Create a [new bot](https://my.slack.com/services/new/bot), and note its API token.

![](t/register-bot.png)

### Use the API Token

```bash
export SLACK_API_TOKEN=xoxb-01234567890-xxxxxxxxxxxxxxxx
```

### RealTime Client Config

![First Slack Bot](t/first_slack_bot.pl)


### REPL Examples

The Real Time Messaging API is a WebSocket-based API that allows you to receive events from Slack in real time and send messages as user.

```prolog

% navigats the web api and switches to the real time messaging system
?- Client = slack_client.clients.new().

?- $Client.register(hello ,
  debug.print. ["Successfully connected, welcome ", $Client.self.name,
   "to the '", $Client.team.name,"' team at https://", team.domain, ".slack.com."]).


?- $Client.register(message , 
   data.text.contains("bot hi") -> message(channel: data.channel, text: ["Hi <@",data.user,">!"]) ;
   not(data.text.contains('bot')) -> message( channel: data.channel, text: ["Sorry <@",data.user,">, what?"])).

?- $Client.register(close ,  debug.print( "Client is about to disconnect")).

% can register on the last created client (returned by slack_client.clients.new )
?- slack_client.current.register(closed , 
  debug.print. "Client has disconnected successfully!").

?- $Client.start().
```

You can send typing indicators with `typing`.

```prolog
?- $Client.typing(channel: data.channel).
```

You can send a ping with `ping`.

```prolog
?- $Client.ping().
```
## Installation

Run `?- pack_install(logicmoo_planner)`.




# Some TODOs

Document this pack!

Write tests

Untangle the 'pack' install deps 
(Moving predicates over here from logicmoo_base)


# Not _obligated_ to maintain a git fork just to contribute

Dislike having tons of forks that are several commits behind the main git repo?

Be old school - Please ask to be added to TeamSPoon and Contribute directly !

Still, we wont stop you from doing it the Fork+PullRequest method

# [BSD 2-Clause License](LICENSE.md)

Copyright (c) 2017, 
TeamSPoon and Douglas Miles <logicmoo@gmail.com> 
All rights reserved.


