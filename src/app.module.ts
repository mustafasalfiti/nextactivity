import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './user/user.module';
import { PostModule } from './post/post.module';
import { CommentModule } from './comment/comment.module';
import { EventModule } from './event/event.module';
import { AuthModule } from './auth/auth.module';
import { MorganInterceptor, MorganModule } from 'nest-morgan';
import { APP_INTERCEPTOR } from '@nestjs/core';
@Module({
  imports: [
    MongooseModule.forRoot("mongodb+srv://admin:admin@cluster0.aisor.mongodb.net/?retryWrites=true&w=majority"),
    UserModule,
    PostModule,
    CommentModule,
    EventModule,
    AuthModule,
    MorganModule
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide:APP_INTERCEPTOR,
      useClass:MorganInterceptor("combined")
    }
  ],
})
export class AppModule { }
