package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	Port         string
	DBDSN        string
	RedisURL     string
	JWTSecret    string
	SupabaseURL  string
	SupabaseKey  string
}

func LoadConfig() *Config {
	_ = godotenv.Load() // ignore error, fallback to env
	return &Config{
		Port:        getEnv("PORT", "8080"),
		DBDSN:       getEnv("DB_DSN", "postgres://postgres:password@localhost:5432/spark?sslmode=disable"),
		RedisURL:    getEnv("REDIS_URL", "redis://localhost:6379"),
		JWTSecret:   getEnv("JWT_SECRET", "super_secret_jwt_key"),
		SupabaseURL: getEnv("SUPABASE_URL", ""),
		SupabaseKey: getEnv("SUPABASE_ANON_KEY", ""),
	}
}

func getEnv(key, fallback string) string {
	if val, ok := os.LookupEnv(key); ok {
		return val
	}
	return fallback
}
