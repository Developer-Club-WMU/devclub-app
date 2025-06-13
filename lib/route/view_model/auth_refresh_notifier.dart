import 'package:devclub_app/ui/auth/view_model/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Go Router is incapable of listening to streams directly. So, we must first convert the stream to a listenable
class AuthRefreshNotifier extends ChangeNotifier {

    late final ProviderSubscription _subscription;

    
    AuthRefreshNotifier(Ref ref) {
        notifyListeners();
        _subscription = ref.listen(
            authStateChangeProvider,
            (_, __) => notifyListeners(),
        );
    }

    @override
    void dispose() {
        _subscription.close();
        super.dispose();
    }
}