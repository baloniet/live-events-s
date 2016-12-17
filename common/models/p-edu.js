'use strict';

module.exports = function (Pedu) {

    Pedu.disableRemoteMethod('__create__education', false);
    Pedu.disableRemoteMethod('__delete__education', false);
    Pedu.disableRemoteMethod('__count__education', false);
    Pedu.disableRemoteMethod('__findById__education', false);
    Pedu.disableRemoteMethod('__get__education', false);
    Pedu.disableRemoteMethod('__updateById__education', false);
    Pedu.disableRemoteMethod('__destroyById__education', false);

};
