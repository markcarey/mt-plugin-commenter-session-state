package CommenterSessionState::App::Comments;

sub init_app {
    my ($cb, $app) = @_;
    if ($app->id eq 'comments') {
        require Sub::Install;
        Sub::Install::install_sub( {
            code => \&session_state,
            into => 'MT::App::Comments',
            as   => 'session_state'
        });
    }
}

sub session_state {
    my $app     = shift;
    my ( $c, $commenter ) = MT::App::session_state($app);
    $app->run_callbacks( 'commenter_session_state', $app, $c, $commenter );
    return ( $c, $commenter );
}


1;
