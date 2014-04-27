var app = require('http').createServer(handler);
var io = require('socket.io').listen(app);
var fs = require('fs');

io.set('flash policy port', -1);
io.set('transports', [
	  , 'flashsocket'
	  , 'xhr-polling'
	  , 'jsonp-polling'
	]);

app.listen(80);

function handler (req, res) {
        console.log(req.url);
        if (req.url == '/crossdomain.xml')
        {
                fs.readFile(__dirname + '/crossdomain.xml',
                        function (err, data) {
                                if (err) {
                                        console.log("cannot open crossdomain");
                                        res.writeHead(500);
                                        return res.end('Error loading cd.xml');
                                }
                                res.writeHead(200, {'Content-Type': 'text/plain'});
                                res.end(data);
                        });
                return;
        }
		else if(req.url == '/index.html')
		{
			fs.readFile(__dirname + '/index.html',
			function (err, data) {
			if (err) {
			  res.writeHead(500);
			  return res.end('Error loading index.html');
			}
			
			res.writeHead(200);
			res.end(data);
		  });
		}
		else
		{
			fs.readFile(__dirname + '/FlxProject.swf',
			function (err, data) {
			if (err) {
			  res.writeHead(500);
			  return res.end('Error loading FlxProject.swf');
			}
			res.writeHead(200, {'Content-Type': 'application/x-shockwave-flash'});
			res.end(data);
		  });			
		}
		
		 
		
	req.on("data",function() {});
};


var g_id = 0;

io.sockets.on('connection', function (socket) {
	
	socket.on('connect_R', function (data) {
		//console.log(data);
		g_id = g_id + 1;
		
		socket.emit('message', { name:'connect_A', playerID:g_id});
	});
	
	socket.on('steering_G', function (data) {
		//console.log(data);
		data.name = 'steering_G';
		io.sockets.emit('message', data);
	});
	
	socket.on('death_G', function (data) {
		//console.log(data);
		data.name = 'death_G';
		io.sockets.emit('message', data);
	});
	
	socket.on('teleport_G', function (data) {
		//console.log(data);
		data.name = 'teleport_G';
		io.sockets.emit('message', data);
	});
	
	socket.on('chat_G', function (data) {
		//console.log(data);
		data.name = 'chat_G';
		io.sockets.emit('message', data);
	});
});