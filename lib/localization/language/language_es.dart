import 'languages.dart';

class LanguageEs extends Languages {
  // SettingsScreen
  @override
  String get settings => 'Ajustes';
  @override
  String get labelSelectLanguage => 'Idioma de la aplicación';
  @override
  String get labelSliderPlan => 'Minutos del plan de llamadas';
  @override
  String get planMensual => 'Plan mensual';
  @override
  String get startDay => 'Día de inicio';
  @override
  String get fromDate => 'Desde';
  @override
  String get toDate => 'Hasta';
  @override
  String get customDate => 'Intervalo de fechas';
  @override
  String get getData => 'OBTENER DATOS';
  @override
  String get close => 'Cerrar';
  @override
  String get unlimited => 'Ilimitado';
  @override
  String get errorRange => 'Error en el intervalo de fechas';
  @override
  String get errorDay => 'Comprueba el día de inicio del plan mensual';
  @override
  String get snackBar => 'Ajustes no guardados';

  // Drawer
  @override
  String get version => 'Versión';
  @override
  String get about => 'Acerca de';
  @override
  String get donar => 'Donar';
  @override
  String get exit => 'Salir';

  // Info
  @override
  String get textInfo => 'Calling Plan Control sirve para gestionar el plan de llamadas '
      'contratado en tu teléfono movil.\n\n'
      'La App muestra los minutos consumidos por las llamadas realizadas en el mes actual '
      '(por defecto) o en un ciclo de facturación seleccionado. También se pueden '
      'consultar las llamadas realizadas en un rango seleccionado de fechas.\n\n'
      'La App está disponible en inglés y en español.';

  // About
  @override
  String get licencia => 'Licencia';
  @override
  String get source => 'Código Abierto';
  @override
  String get textAbout =>
      'Calling Plan Control es Software libre y de Código Abierto para la plataforma '
      'Android.\n\nCódigo fuente en Github. Si experimentas algún problema o quieres  '
      'proponer alguna mejora utiliza este enlace a la página del proyecto en Github:';
  @override
  String get privacidad => 'Privacidad';
  @override
  String get textPrivacidad => 'Aplicación gratuita y sin publicidad.\n\n'
      'Esta aplicación no extrae ni almacena ninguna información del '
      'usuario ni requiere ningún permiso extraño (solo permiso para '
      'acceder al registro del historial de llamadas), y renuncia a la '
      'publicidad y a cualquier mecanismo de seguimiento.\n\n'
      'Software libre de spyware, malware, virus o cualquier proceso '
      'que atente contra tu dispositivo o viole tu privacidad.';
  @override
  String get textLicencia => 'Esta app se comparte bajo las condiciones de la GNU General '
      'Public License v.3 con la esperanza de que sea útil, pero SIN NINGUNA GARANTÍA.\n\n'
      'Este programa es software libre: usted puede redistribuirlo y modificarlo bajo los '
      'términos de la Licencia Pública General GNU publicada por la Fundación para el '
      'Software Libre, versión 3 (GPLv3).\n\nLa Licencia Pública General de GNU no permite '
      'incorporar este programa en programas propietarios.\n\nPara más información, ver '
      '<https://www.gnu.org/licenses/>.';

  // Donar
  @override
  String get textDonate => 'Calling Plan Control es Software libre y de Código Abierto.\n\n'
      'Puedes colaborar con el desarrollo de ésta y otras aplicaciones con una pequeña '
      'aportación a mi monedero de Bitcoins (pulsa el boton para copiar la dirección de Bitcoin):';

  // TAB ONE
  @override
  String get minLibres => 'min. libres';
  @override
  get callOut => 'llamadas realizadas';

  //TAB TWO
  @override
  String get noCalls => 'Ninguna llamada realizada.';
  @override
  String get sec => 'seg.';
}
