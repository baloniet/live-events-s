'use strict';

module.exports = function (Pemp) {

  Pemp.disableRemoteMethod('__create__employment', false);
  Pemp.disableRemoteMethod('__delete__employment', false);
  Pemp.disableRemoteMethod('__count__employment', false);
  Pemp.disableRemoteMethod('__findById__employment', false);
  Pemp.disableRemoteMethod('__get__employment', false);
  Pemp.disableRemoteMethod('__updateById__employment', false);
  Pemp.disableRemoteMethod('__destroyById__employment', false);

};
