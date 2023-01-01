import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tieup/core/constants/api_constant.dart';
import 'package:tieup/core/error/exceptions.dart';
import 'package:tieup/features/skill/data/models/domain_model.dart';
import 'package:tieup/features/skill/data/models/skill_model.dart';
import 'package:tieup/features/skill/data/models/sub_domain_model.dart';
import 'package:tieup/features/skill/domain/entities/skill.dart';

abstract class SkillRemoteDataSource {
  Future<List<DomainModel>> getDomains();
  Future<List<SubDomainModel>> getSubDomains(int domainId);
  Future<List<SkillModel>> getSkills(int subDomainId);
  Future<List<SkillModel>> getUserSkills();
  Future<List<Skill>> addUserSkills(List<Skill> skills);
}

class SkillRemoteDataSourceImpl implements SkillRemoteDataSource {
  http.Client client;
  SkillRemoteDataSourceImpl(this.client);

  @override
  Future<List<DomainModel>> getDomains() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/skill/domain/get',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 210) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((domainItem) =>
                DomainModel.fromJSon(domainItem as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SubDomainModel>> getSubDomains(int domainId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/skill/SubDomain/get/$domainId',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 210) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((subDomainItem) =>
                SubDomainModel.fromJSon(subDomainItem as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SkillModel>> getUserSkills() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/skill/SharedSkill/getSkillUser',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 210) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((skill) => SkillModel.fromJson(skill as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<SkillModel>> getSkills(int subDomainId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await client.get(
        Uri.parse(
          '$kBaseUrl/skill/Skill/get/$subDomainId',
        ),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 210) {
        final responseData = json.decode(response.body)['data'];
        return (responseData as List<dynamic>)
            .map((skill) => SkillModel.fromJson(skill as Map<String, dynamic>))
            .toList();
      } else if (response.statusCode == 401) {
        throw UnauthenticatedException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<Skill>> addUserSkills(List<Skill> skills) async {
    // try {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await client.post(
      Uri.parse(
        '$kBaseUrl/skill/SharedSkill/createOrUpdate',
      ),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        "skillable_type": "user",
        "skillable_id": 1,
        "skills": [
          for (var e in skills) {"skill_id": e.id, "level": 4},
        ]
      }),
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return await getUserSkills();
    } else if (response.statusCode == 401) {
      throw UnauthenticatedException();
    } else {
      throw ServerException();
    }
    // } catch (e) {
    //   throw ServerException();
    // }
  }
}
