FROM golang:1.9

MAINTAINER hunterhug <gdccmcm@live.com>

RUN mkdir -p $GOPATH/src/github.com/Go-zh/tour
ADD . $GOPATH/src/github.com/Go-zh/tour
RUN cp -r $GOPATH/src/github.com/Go-zh/tour/vendor/* $GOPATH/src/
RUN cd $GOPATH/src/github.com/Go-zh/tour/gotour && go build && mv gotour /go/bin
RUN chmod a+x /go/bin/gotour
CMD ["gotour","--http=0.0.0.0:9999","--openbrowser=false"]