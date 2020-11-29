################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../run/file-transfer-application.cc \
../run/file-transfer-helper.cc \
../run/mp-onoff-application.cc \
../run/mptcp-helper-os.cc \
../run/mptcp-helper-router.cc \
../run/mptcp-test.cc \
../run/rl_ClientSocket.cc \
../run/rl_RealSocket.cc 

CC_DEPS += \
./run/file-transfer-application.d \
./run/file-transfer-helper.d \
./run/mp-onoff-application.d \
./run/mptcp-helper-os.d \
./run/mptcp-helper-router.d \
./run/mptcp-test.d \
./run/rl_ClientSocket.d \
./run/rl_RealSocket.d 

OBJS += \
./run/file-transfer-application.o \
./run/file-transfer-helper.o \
./run/mp-onoff-application.o \
./run/mptcp-helper-os.o \
./run/mptcp-helper-router.o \
./run/mptcp-test.o \
./run/rl_ClientSocket.o \
./run/rl_RealSocket.o 


# Each subdirectory must supply rules for building sources it contributes
run/%.o: ../run/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


