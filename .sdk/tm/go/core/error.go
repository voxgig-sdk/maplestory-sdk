package core

type MaplestoryError struct {
	IsMaplestoryError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewMaplestoryError(code string, msg string, ctx *Context) *MaplestoryError {
	return &MaplestoryError{
		IsMaplestoryError: true,
		Sdk:              "Maplestory",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *MaplestoryError) Error() string {
	return e.Msg
}
