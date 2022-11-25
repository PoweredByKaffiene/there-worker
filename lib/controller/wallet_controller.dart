import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

class WalletController extends GetxController {
  final Rx<WalletConnect?> _connector = Rx<WalletConnect?>(null);

  WalletConnect? get connector => _connector.value;
  set connector(WalletConnect? value) => _connector.value = value;

  final Rx<WalletConnectSession?> _session = Rx<WalletConnectSession?>(null);

  WalletConnectSession? get session => _session.value;
  set session(WalletConnectSession? value) => _session.value = value;

  final sessionStorage = WalletConnectSecureStorage();

  @override
  void onInit() {
    super.onInit();

    initConnector();
  }

  void initConnector() async {
    session = await sessionStorage.getSession();
    print("session: $session");

    connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      session: session,
      sessionStorage: sessionStorage,
      clientMeta: const PeerMeta(
        name: 'There',
        description: 'There Worker App',
        url: 'https://github.com/PoweredByKaffiene/there-worker',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );
  }

  void createSession() async {
    await connector?.createSession(
      chainId: 137,
      onDisplayUri: (uri) async {
        await launchUrlString(uri);
      },
    );
  }

  void killSession() async {
    await connector?.killSession(sessionError: "Killed by user");
  }

  bool isConnected() => session?.connected ?? false;
}
