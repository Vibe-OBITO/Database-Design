package main

import (
	"github.com/Vibe-OBITO/database-design/laboratory work №2/pkg/apiserver"
	_ "github.com/lib/pq"
	"log"
"
	_ "github.com/lib/pq"
	"log"
)

func main() {

	config := apiserver.NewConfig()

	s := apiserver.New(config)

	// starting server
	if err := s.Start(); err != nil {
		log.Fatal(err)
	}
}


