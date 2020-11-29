################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/olsr/test/bug780-test.cc \
../forbackup/src/olsr/test/hello-regression-test.cc \
../forbackup/src/olsr/test/olsr-header-test-suite.cc \
../forbackup/src/olsr/test/olsr-routing-protocol-test-suite.cc \
../forbackup/src/olsr/test/regression-test-suite.cc \
../forbackup/src/olsr/test/tc-regression-test.cc 

CC_DEPS += \
./forbackup/src/olsr/test/bug780-test.d \
./forbackup/src/olsr/test/hello-regression-test.d \
./forbackup/src/olsr/test/olsr-header-test-suite.d \
./forbackup/src/olsr/test/olsr-routing-protocol-test-suite.d \
./forbackup/src/olsr/test/regression-test-suite.d \
./forbackup/src/olsr/test/tc-regression-test.d 

OBJS += \
./forbackup/src/olsr/test/bug780-test.o \
./forbackup/src/olsr/test/hello-regression-test.o \
./forbackup/src/olsr/test/olsr-header-test-suite.o \
./forbackup/src/olsr/test/olsr-routing-protocol-test-suite.o \
./forbackup/src/olsr/test/regression-test-suite.o \
./forbackup/src/olsr/test/tc-regression-test.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/olsr/test/%.o: ../forbackup/src/olsr/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


