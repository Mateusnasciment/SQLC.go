package main

import (
	"context"
	"database/sql"
)

func main() {
	dbcon, err := sql.Open("mysql", "user:password@tcp(localhost:3306)/dbname")
	if err != nil {
		panic(err.Error())
	}
	defer dbcon.Close()

	// Execute the query
	dt := db.New(dbcon)

	ctx := context.Background()
	dt.GetCategory(ctx, 1)

}
