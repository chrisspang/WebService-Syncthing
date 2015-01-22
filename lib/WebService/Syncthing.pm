
package WebService::Syncthing;

# ABSTRACT: Client library for Syncthing API

use Moo;
with 'WebService::Client';

has '+base_url' => ( default => 'https://localhost:8080/rest' );

has auth_token  => ( is => 'ro' );

sub BUILD {
    my ($self) = @_;

    my $auth_token = $self->auth_token();
    if ($auth_token) {
        print "Setting token ($auth_token)\n";
        $self->ua->default_header('X-API-Key' => $auth_token);
    }

}

## https://github.com/syncthing/syncthing/wiki/REST-Interface

sub get_ping {
    my $self = shift;
    return $self->get('/ping');
}

sub get_version {
    my $self = shift;
    return $self->get('/version');
}

sub get_model {
    my ($self, $folder) = @_;
    return $self->get("/model?folder=$folder");
}

sub get_connections {
    my $self = shift;
    return $self->get('/connections');
}

sub get_completion {
    my ($self, $device, $folder) = @_;

    return $self->get("/completion?device=$device&folder=$folder");
}

sub get_config {
    my $self = shift;

    return $self->get('/config');
}

sub get_config_sync {
    my $self = shift;

    return $self->get('/config/sync');
}

sub get_system {
    my $self = shift;

    return $self->get('/system');
}

sub get_errors {
    my $self = shift;
    return $self->get('/errors');
}

sub get_discovery {
    my $self = shift;
    return $self->get('/discovery');
}

sub get_deviceid {
    my ($self, $deviceid) = @_;
    return $self->get("/deviceid?id=$deviceid");
}

sub get_upgrade {
    my $self = shift;
    return $self->get('/upgrade');
}

sub get_ignores {
    my ($self, $folder) = @_;
    return $self->get("/ignores?folder=$folder");
}

sub get_need {
    my ($self, $folder) = @_;
    return $self->get("/need?folder=$folder");
}

# POST

sub post_ping {
    my $self = shift;

    return $self->post('/ping');
}

sub post_scan {
    my ($self, $data) = @_;

    my $url = "/scan?folder=" . $data->{folder};

    if ($data->{sub}) {
        $url .= "?sub=" . $data->{sub};
    }

    return $self->post($url);
}

1;

=head1 SYNOPSIS

  use WebService::Syncthing;
  my $Syncthing = WebService::Synthing->new(
         base_url   => 'http://server:port/rest',
         auth_token => 'optional_auth_token',
  );

  $Syncthing->get_ping();

=head1 DESCRIPTION

Simple client for talking to the Syncthing GUI using the REST API.

=head1 METHODS

=head2 auth_token

The auth_token used to authenticate against the Syncthing GUI. Passed
as a X-API-Key header in requests.

=head2 BUILD

=head1 GET Requests

=head2 new

=head2 get_ping

Ping using a GET request.

=head2 get_version

=head2 get_model

=head2 get_connections

=head2 get_completion

=head2 get_config

=head2 get_config_sync

=head2 get_system

=head2 get_errors

=head2 get_discovery

=head2 get_deviceid

=head2 get_upgrade

=head2 get_ignores

=head2 get_need

=head1 POST Requests

=head2 post_ping

=head2 post_scan

=cut
