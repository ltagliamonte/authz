package model

type Attribute struct {
	ID    int    `json:"-" gorm:"primarykey"`
	Key   string `json:"key"`
	Value string `json:"value"`
}

func (Attribute) TableName() string {
	return "authz_attributes"
}