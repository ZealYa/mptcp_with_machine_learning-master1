################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../forbackup/src/internet/helper/internet-stack-helper.cc \
../forbackup/src/internet/helper/internet-trace-helper.cc \
../forbackup/src/internet/helper/ipv4-address-helper.cc \
../forbackup/src/internet/helper/ipv4-global-routing-helper.cc \
../forbackup/src/internet/helper/ipv4-interface-container.cc \
../forbackup/src/internet/helper/ipv4-list-routing-helper.cc \
../forbackup/src/internet/helper/ipv4-routing-helper.cc \
../forbackup/src/internet/helper/ipv4-static-routing-helper.cc \
../forbackup/src/internet/helper/ipv6-address-helper.cc \
../forbackup/src/internet/helper/ipv6-interface-container.cc \
../forbackup/src/internet/helper/ipv6-list-routing-helper.cc \
../forbackup/src/internet/helper/ipv6-routing-helper.cc \
../forbackup/src/internet/helper/ipv6-static-routing-helper.cc \
../forbackup/src/internet/helper/rip-helper.cc \
../forbackup/src/internet/helper/ripng-helper.cc 

CC_DEPS += \
./forbackup/src/internet/helper/internet-stack-helper.d \
./forbackup/src/internet/helper/internet-trace-helper.d \
./forbackup/src/internet/helper/ipv4-address-helper.d \
./forbackup/src/internet/helper/ipv4-global-routing-helper.d \
./forbackup/src/internet/helper/ipv4-interface-container.d \
./forbackup/src/internet/helper/ipv4-list-routing-helper.d \
./forbackup/src/internet/helper/ipv4-routing-helper.d \
./forbackup/src/internet/helper/ipv4-static-routing-helper.d \
./forbackup/src/internet/helper/ipv6-address-helper.d \
./forbackup/src/internet/helper/ipv6-interface-container.d \
./forbackup/src/internet/helper/ipv6-list-routing-helper.d \
./forbackup/src/internet/helper/ipv6-routing-helper.d \
./forbackup/src/internet/helper/ipv6-static-routing-helper.d \
./forbackup/src/internet/helper/rip-helper.d \
./forbackup/src/internet/helper/ripng-helper.d 

OBJS += \
./forbackup/src/internet/helper/internet-stack-helper.o \
./forbackup/src/internet/helper/internet-trace-helper.o \
./forbackup/src/internet/helper/ipv4-address-helper.o \
./forbackup/src/internet/helper/ipv4-global-routing-helper.o \
./forbackup/src/internet/helper/ipv4-interface-container.o \
./forbackup/src/internet/helper/ipv4-list-routing-helper.o \
./forbackup/src/internet/helper/ipv4-routing-helper.o \
./forbackup/src/internet/helper/ipv4-static-routing-helper.o \
./forbackup/src/internet/helper/ipv6-address-helper.o \
./forbackup/src/internet/helper/ipv6-interface-container.o \
./forbackup/src/internet/helper/ipv6-list-routing-helper.o \
./forbackup/src/internet/helper/ipv6-routing-helper.o \
./forbackup/src/internet/helper/ipv6-static-routing-helper.o \
./forbackup/src/internet/helper/rip-helper.o \
./forbackup/src/internet/helper/ripng-helper.o 


# Each subdirectory must supply rules for building sources it contributes
forbackup/src/internet/helper/%.o: ../forbackup/src/internet/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


