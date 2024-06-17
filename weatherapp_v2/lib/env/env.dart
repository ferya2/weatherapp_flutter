import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'DISASTER_API_KEY')
  static final String apiKey = _Env.apiKey;
}
