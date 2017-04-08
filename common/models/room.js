'use strict';

module.exports = function (Room) {
  Room.isRoomFree = function (id, starttime, endtime, cb) {
    var ds = Room.dataSource;
    var sql = "select isroomfree(" + id + "," + starttime + "," + endtime + ")";
    ds.connector.execute(sql, function (err, isRoomFree) {
      if (err)
        console.error(err);
      cb(err, isRoomFree);
    });
  };

  Room.remoteMethod('isRoomFree', {
    http: {
      verb: 'post',
      path: '/:id/isRoomFree'
    },
    accepts: [{
      arg: 'id',
      type: 'number',
      required: true,
      description: 'Room id'
    }, {
      arg: 'starttime',
      type: 'string',
      required: true,
      description: 'start time'
    },{
      arg: 'endtime',
      type: 'string',
      required: true,
      description: 'end time'
    }],
    returns: {
      type: 'Object',
      root: true
    },
    description: 'Check if room is free'
  });
};
