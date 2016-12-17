'use strict';

module.exports = function(Aperson) {
    Aperson.disableRemoteMethod('__get__person', false);
    Aperson.disableRemoteMethod('__get__activity', false);
};
