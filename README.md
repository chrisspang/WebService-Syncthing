# NAME

WebService::Syncthing - Client library for Syncthing API

# VERSION

version 0.003

# SYNOPSIS

    use WebService::Syncthing;
    my $Syncthing = WebService::Synthing->new(
           base_url   => 'http://server:port/rest',
           auth_token => 'optional_auth_token',
    );

    $Syncthing->get_ping();

# DESCRIPTION

Simple client for talking to the Syncthing GUI using the REST API.

# METHODS

## auth\_token

The auth\_token used to authenticate against the Syncthing GUI. Passed
as a X-API-Key header in requests.

## BUILD

# GET Requests

## new

## get\_ping

Ping using a GET request.

## get\_version

## get\_model

## get\_connections

## get\_completion

## get\_config

## get\_config\_sync

## get\_system

## get\_errors

## get\_discovery

## get\_deviceid

## get\_upgrade

## get\_ignores

## get\_need

# POST Requests

## post\_ping

## post\_config

## post\_restart

## post\_reset

## post\_shutdown

## post\_error

## post\_error\_clear

## post\_discovery\_hint

## post\_scan

## post\_upgrade

## post\_ignores

## post\_bump

# AUTHOR

Chris Hughes <chrisjh@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Chris Hughes.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
