'use strict';

module.exports = function(Atemplate) {
    Atemplate.disableRemoteMethod('__get__template', false);
    Atemplate.disableRemoteMethod('__get__activity', false);
};
