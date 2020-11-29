################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../scratch/run/file-transfer-application.cc \
../scratch/run/file-transfer-helper.cc \
../scratch/run/mp-onoff-application.cc \
../scratch/run/mptcp-helper-application.cc \
../scratch/run/mptcp-helper-router.cc \
../scratch/run/mptcp-helper-system.cc \
../scratch/run/mptcp-helper-topology.cc \
../scratch/run/mptcp-helper-trace.cc \
../scratch/run/mptcp-test.cc 

CC_DEPS += \
./scratch/run/file-transfer-application.d \
./scratch/run/file-transfer-helper.d \
./scratch/run/mp-onoff-application.d \
./scratch/run/mptcp-helper-application.d \
./scratch/run/mptcp-helper-router.d \
./scratch/run/mptcp-helper-system.d \
./scratch/run/mptcp-helper-topology.d \
./scratch/run/mptcp-helper-trace.d \
./scratch/run/mptcp-test.d 

OBJS += \
./scratch/run/file-transfer-application.o \
./scratch/run/file-transfer-helper.o \
./scratch/run/mp-onoff-application.o \
./scratch/run/mptcp-helper-application.o \
./scratch/run/mptcp-helper-router.o \
./scratch/run/mptcp-helper-system.o \
./scratch/run/mptcp-helper-topology.o \
./scratch/run/mptcp-helper-trace.o \
./scratch/run/mptcp-test.o 


# Each subdirectory must supply rules for building sources it contributes
scratch/run/%.o: ../scratch/run/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


