################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/core/examples/command-line-example.cc \
../forbackup/src/core/examples/hash-example.cc \
../forbackup/src/core/examples/main-callback.cc \
../forbackup/src/core/examples/main-ptr.cc \
../forbackup/src/core/examples/main-random-variable-stream.cc \
../forbackup/src/core/examples/main-random-variable.cc \
../forbackup/src/core/examples/main-test-sync.cc \
../forbackup/src/core/examples/sample-random-variable-stream.cc \
../forbackup/src/core/examples/sample-random-variable.cc \
../forbackup/src/core/examples/sample-simulator.cc 

CC_DEPS += \
./forbackup/src/core/examples/command-line-example.d \
./forbackup/src/core/examples/hash-example.d \
./forbackup/src/core/examples/main-callback.d \
./forbackup/src/core/examples/main-ptr.d \
./forbackup/src/core/examples/main-random-variable-stream.d \
./forbackup/src/core/examples/main-random-variable.d \
./forbackup/src/core/examples/main-test-sync.d \
./forbackup/src/core/examples/sample-random-variable-stream.d \
./forbackup/src/core/examples/sample-random-variable.d \
./forbackup/src/core/examples/sample-simulator.d 

OBJS += \
./forbackup/src/core/examples/command-line-example.o \
./forbackup/src/core/examples/hash-example.o \
./forbackup/src/core/examples/main-callback.o \
./forbackup/src/core/examples/main-ptr.o \
./forbackup/src/core/examples/main-random-variable-stream.o \
./forbackup/src/core/examples/main-random-variable.o \
./forbackup/src/core/examples/main-test-sync.o \
./forbackup/src/core/examples/sample-random-variable-stream.o \
./forbackup/src/core/examples/sample-random-variable.o \
./forbackup/src/core/examples/sample-simulator.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/core/examples/%.o: ../forbackup/src/core/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


