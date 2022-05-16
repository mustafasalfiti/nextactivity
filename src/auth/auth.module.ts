import { Module } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { UserModule } from 'src/user/user.module';
import { JwtModule } from '@nestjs/jwt';
import { JwtStrategy } from './JwtAuth/jwt.strategy';
import { LocalStrategy } from './LocalAuth/local.strategy';

@Module({
  imports: [
    PassportModule,
    UserModule,
    JwtModule.register({
      secret: 'just_a_dummy_secret',
      signOptions:{expiresIn:'60h'}
    })
  ],
  providers: [
    AuthService,
    LocalStrategy,
    JwtStrategy
  ],
  controllers: [AuthController]
})
export class AuthModule { }
