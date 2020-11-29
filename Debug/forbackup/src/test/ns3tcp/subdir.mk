################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/test/ns3tcp/ns3tcp-cwnd-test-suite.cc \
../forbackup/src/test/ns3tcp/ns3tcp-interop-test-suite.cc \
../forbackup/src/test/ns3tcp/ns3tcp-loss-test-suite.cc \
../forbackup/src/test/ns3tcp/ns3tcp-no-delay-test-suite.cc \
../forbackup/src/test/ns3tcp/ns3tcp-socket-test-suite.cc \
../forbackup/src/test/ns3tcp/ns3tcp-socket-writer.cc \
../forbackup/src/test/ns3tcp/ns3tcp-state-test-suite.cc \
../forbackup/src/test/ns3tcp/nsctcp-loss-test-suite.cc 

CC_DEPS += \
./forbackup/src/test/ns3tcp/ns3tcp-cwnd-test-suite.d \
./forbackup/src/test/ns3tcp/ns3tcp-interop-test-suite.d \
./forbackup/src/test/ns3tcp/ns3tcp-loss-test-suite.d \
./forbackup/src/test/ns3tcp/ns3tcp-no-delay-test-suite.d \
./forbackup/src/test/ns3tcp/ns3tcp-socket-test-suite.d \
./forbackup/src/test/ns3tcp/ns3tcp-socket-writer.d \
./forbackup/src/test/ns3tcp/ns3tcp-state-test-suite.d \
./forbackup/src/test/ns3tcp/nsctcp-loss-test-suite.d 

OBJS += \
./forbackup/src/test/ns3tcp/ns3tcp-cwnd-test-suite.o \
./forbackup/src/test/ns3tcp/ns3tcp-interop-test-suite.o \
./forbackup/src/test/ns3tcp/ns3tcp-loss-test-suite.o \
./forbackup/src/test/ns3tcp/ns3tcp-no-delay-test-suite.o \
./forbackup/src/test/ns3tcp/ns3tcp-socket-test-suite.o \
./forbackup/src/test/ns3tcp/ns3tcp-socket-writer.o \
./forbackup/src/test/ns3tcp/ns3tcp-state-test-suite.o \
./forbackup/src/test/ns3tcp/nsctcp-loss-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/test/ns3tcp/%.o: ../forbackup/src/test/ns3tcp/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


