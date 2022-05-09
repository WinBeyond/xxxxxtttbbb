package main

import (
	"log"

	"git.woa.com/devx/skemaloop/grpc-go/grpc"
	"git.woa.com/devx/skemaloop/grpc-go/logging"
	"xxxx/internal/services/xxx"
	pb "github.com/skema-repo/WinBeyond/grpc-go/XXXX/XXX"
)

func main() {
	srv := grpc.NewServer()
	srvImp := xxx.NewXxx()
	pb.RegisterXXXXXServer(srv, srvImp)

	ctx, mux, conn := srv.GetGatewayInfo(srvImp, &pb.XXXXX_ServiceDesc)
    pb.RegisterXXXXXHandlerClient(ctx, mux, pb.NewXXXXXClient(conn))

	log.Printf("Serving gRPC ...")
	if err := srv.Serve(); err != nil {
		logging.Fatalf("Serve error %v", err.Error())
	}
}
