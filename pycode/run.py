#!/usr/bin/env python
# -*-coding:utf-8-*-

import argparse

import tornado.ioloop
import tornado.web


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world3")


def make_app():
    return tornado.web.Application(
        [
            (r"/", MainHandler),
        ],
        debug=True
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--port',
        type=int,
        help=("port listened by tornado.")
    )
    args = parser.parse_args()
    port = args.port

    app = make_app()
    app.listen(port, '0.0.0.0')
    tornado.ioloop.IOLoop.current().start()
