// Code generated by MockGen. DO NOT EDIT.
// Source: internal/entity/manager/compiled.go

// Package manager is a generated GoMock package.
package manager

import (
	reflect "reflect"

	model "github.com/eko/authz/backend/internal/entity/model"
	gomock "github.com/golang/mock/gomock"
)

// MockCompiledPolicy is a mock of CompiledPolicy interface.
type MockCompiledPolicy struct {
	ctrl     *gomock.Controller
	recorder *MockCompiledPolicyMockRecorder
}

// MockCompiledPolicyMockRecorder is the mock recorder for MockCompiledPolicy.
type MockCompiledPolicyMockRecorder struct {
	mock *MockCompiledPolicy
}

// NewMockCompiledPolicy creates a new mock instance.
func NewMockCompiledPolicy(ctrl *gomock.Controller) *MockCompiledPolicy {
	mock := &MockCompiledPolicy{ctrl: ctrl}
	mock.recorder = &MockCompiledPolicyMockRecorder{mock}
	return mock
}

// EXPECT returns an object that allows the caller to indicate expected use.
func (m *MockCompiledPolicy) EXPECT() *MockCompiledPolicyMockRecorder {
	return m.recorder
}

// Create mocks base method.
func (m *MockCompiledPolicy) Create(compiledPolicy []*model.CompiledPolicy) error {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "Create", compiledPolicy)
	ret0, _ := ret[0].(error)
	return ret0
}

// Create indicates an expected call of Create.
func (mr *MockCompiledPolicyMockRecorder) Create(compiledPolicy interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "Create", reflect.TypeOf((*MockCompiledPolicy)(nil).Create), compiledPolicy)
}

// GetRepository mocks base method.
func (m *MockCompiledPolicy) GetRepository() CompiledPolicyRepository {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "GetRepository")
	ret0, _ := ret[0].(CompiledPolicyRepository)
	return ret0
}

// GetRepository indicates an expected call of GetRepository.
func (mr *MockCompiledPolicyMockRecorder) GetRepository() *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "GetRepository", reflect.TypeOf((*MockCompiledPolicy)(nil).GetRepository))
}

// IsAllowed mocks base method.
func (m *MockCompiledPolicy) IsAllowed(principalID, resourceKind, resourceValue, actionID string) (bool, error) {
	m.ctrl.T.Helper()
	ret := m.ctrl.Call(m, "IsAllowed", principalID, resourceKind, resourceValue, actionID)
	ret0, _ := ret[0].(bool)
	ret1, _ := ret[1].(error)
	return ret0, ret1
}

// IsAllowed indicates an expected call of IsAllowed.
func (mr *MockCompiledPolicyMockRecorder) IsAllowed(principalID, resourceKind, resourceValue, actionID interface{}) *gomock.Call {
	mr.mock.ctrl.T.Helper()
	return mr.mock.ctrl.RecordCallWithMethodType(mr.mock, "IsAllowed", reflect.TypeOf((*MockCompiledPolicy)(nil).IsAllowed), principalID, resourceKind, resourceValue, actionID)
}