
/// Chose enum for type safety
enum AppRoutes {
    logIn,
    signUp,
    event,
    eventsList,
    eventDetails,
    project,
    challenge,
    resource,
    info,
}

extension AppRoutesExtension on AppRoutes {
    
    String get path {
    switch (this) {
        case AppRoutes.event:
          return '/';
        case AppRoutes.eventsList:
          return '/events_list';
        case AppRoutes.eventDetails:
          return '/event_details';
        case AppRoutes.logIn:
          return '/logIn';
        case AppRoutes.signUp:
          return '/signup';
        case AppRoutes.project:
          return '/projects';
        case AppRoutes.challenge:
          return '/challenges';
        case AppRoutes.resource: 
          return '/resources';
        case AppRoutes.info:
          return '/info';
        default:
          throw UnimplementedError('Missing routeName for $this');
        }
    }

    String get name {
        switch (this) {
            case AppRoutes.logIn:
                return 'LogIn';
            case AppRoutes.signUp:
                return 'SignUp';
            case AppRoutes.event:
                return 'Event';
            case AppRoutes.eventsList:
                return 'EventsList';
            case AppRoutes.eventDetails:
                return 'EventDetails';
            case AppRoutes.project:
                return 'Project';
            case AppRoutes.challenge:
                return 'Challenge';
            case AppRoutes.resource:
                return 'Resource';
            case AppRoutes.info:
                return 'Info';
            default:
                throw UnimplementedError('Missing routeName for $this');
        }
    }
}