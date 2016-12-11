'use strict';

module.exports = function (Activity) {

    Activity.disableRemoteMethod('__create__aPers', false);
    Activity.disableRemoteMethod('__delete__aPers', false);
    Activity.disableRemoteMethod('__count__aPers', false);
    Activity.disableRemoteMethod('__findById__aPers', false);
    Activity.disableRemoteMethod('__updateById__aPers', false);
    Activity.disableRemoteMethod('__destroyById__aPers', false);

        Activity.disableRemoteMethod('__create__people', false);
    Activity.disableRemoteMethod('__delete__people', false);
    Activity.disableRemoteMethod('__count__people', false);
    Activity.disableRemoteMethod('__findById__people', false);
    Activity.disableRemoteMethod('__updateById__people', false);
    Activity.disableRemoteMethod('__destroyById__people', false);

};
