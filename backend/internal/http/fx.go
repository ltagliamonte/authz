package http

import (
	"github.com/eko/authz/backend/internal/http/handler"
	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"go.uber.org/fx"
)

func FxModule() fx.Option {
	return fx.Module("http",
		fx.Provide(
			func() *fiber.App {
				return fiber.New(fiber.Config{
					DisableStartupMessage: true,
				})
			},
			NewServer,
			handler.NewHandlers,
			validator.New,
		),
	)
}