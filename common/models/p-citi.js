'use strict';

module.exports = function(Pciti) {
    Pciti.disableRemoteMethod('__create__cips', false);
    Pciti.disableRemoteMethod('__delete__cips', false);
    Pciti.disableRemoteMethod('__count__cips', false);
    Pciti.disableRemoteMethod('__findById__cips', false);
    Pciti.disableRemoteMethod('__get__cips', false);
    Pciti.disableRemoteMethod('__updateById__cips', false);
    Pciti.disableRemoteMethod('__destroyById__cips', false);
};
