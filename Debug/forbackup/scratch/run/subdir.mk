################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/scratch/run/file-transfer-application.cc \
../forbackup/scratch/run/file-transfer-helper.cc \
../forbackup/scratch/run/mp-onoff-application.cc \
../forbackup/scratch/run/mptcp-helper-application.cc \
../forbackup/scratch/run/mptcp-helper-router.cc \
../forbackup/scratch/run/mptcp-helper-system.cc \
../forbackup/scratch/run/mptcp-helper-topology.cc \
../forbackup/scratch/run/mptcp-helper-trace.cc \
../forbackup/scratch/run/mptcp-test.cc 

CC_DEPS += \
./forbackup/scratch/run/file-transfer-application.d \
./forbackup/scratch/run/file-transfer-helper.d \
./forbackup/scratch/run/mp-onoff-application.d \
./forbackup/scratch/run/mptcp-helper-application.d \
./forbackup/scratch/run/mptcp-helper-router.d \
./forbackup/scratch/run/mptcp-helper-system.d \
./forbackup/scratch/run/mptcp-helper-topology.d \
./forbackup/scratch/run/mptcp-helper-trace.d \
./forbackup/scratch/run/mptcp-test.d 

OBJS += \
./forbackup/scratch/run/file-transfer-application.o \
./forbackup/scratch/run/file-transfer-helper.o \
./forbackup/scratch/run/mp-onoff-application.o \
./forbackup/scratch/run/mptcp-helper-application.o \
./forbackup/scratch/run/mptcp-helper-router.o \
./forbackup/scratch/run/mptcp-helper-system.o \
./forbackup/scratch/run/mptcp-helper-topology.o \
./forbackup/scratch/run/mptcp-helper-trace.o \
./forbackup/scratch/run/mptcp-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/scratch/run/%.o: ../forbackup/scratch/run/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


