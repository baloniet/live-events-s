'use strict';

module.exports = function(Pstat) {
    Pstat.disableRemoteMethod('__get__statement', false);
    Pstat.disableRemoteMethod('__get__person', false);
};
